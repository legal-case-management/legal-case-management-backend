package server.config;

import io.lettuce.core.RedisURI;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;

@Configuration
public class RedisConfig {

    @Value("${redis.url}")
    private String redisUrl;

    @Bean
    public LettuceConnectionFactory redisConnectionFactory() {
        RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
        RedisURI redisURI = RedisURI.create(redisUrl);
        config.setHostName(redisURI.getHost());
        config.setPort(redisURI.getPort());
        config.setUsername(redisURI.getUsername());
        config.setPassword(redisURI.getPassword());

        // Bật SSL
        return new LettuceConnectionFactory(config, LettuceClientConfiguration.builder()
                .useSsl()
                .build());
    }
}
