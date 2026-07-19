package com.qlatakv9dt.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.List;

/** Đếm request theo cửa sổ cố định (fixed window) trên Redis, dùng chung cho mọi rate limiter của backend. */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RateLimiterService {
    StringRedisTemplate rateLimitRedis;

    /* INCR key rồi set TTL đúng 1 lần (khi key vừa được tạo) — atomic để tránh race giữa các request đồng thời. */
    static final DefaultRedisScript<Long> INCREMENT_SCRIPT = new DefaultRedisScript<>("""
            local count = redis.call('INCR', KEYS[1])
            if count == 1 then
                redis.call('PEXPIRE', KEYS[1], ARGV[1])
            end
            return count
            """, Long.class);

    /**
     * Tăng bộ đếm cho {@code key} trong cửa sổ {@code window} và cho biết còn được phép request hay không.
     * @return true nếu request thứ {@code count} vẫn nằm trong giới hạn {@code limit}.
     */
    public boolean tryAcquire(String key, int limit, Duration window) {
        Long count = rateLimitRedis.execute(
                INCREMENT_SCRIPT,
                List.of(key),
                String.valueOf(window.toMillis())
        );
        return count != null && count <= limit;
    }
}
