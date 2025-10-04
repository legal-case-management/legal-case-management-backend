package server.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import io.lettuce.core.ClientOptions;
import io.lettuce.core.SslOptions;

@Configuration
public class RedisConfig {

    @Value("${spring.data.redis.url}")
    private String redisUrl;

    @Bean
    public LettuceConnectionFactory redisConnectionFactory() {
        String[] urlParts = redisUrl.replace("rediss://", "").split("@");
        String[] authParts = urlParts[0].split(":");
        String[] hostParts = urlParts[1].split(":");

        String username = authParts[0];
        String password = authParts[1];
        String host = hostParts[0];
        int port = Integer.parseInt(hostParts[1]);

        RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
        config.setHostName(host);
        config.setPort(port);
        config.setUsername(username);
        config.setPassword(password);

        LettuceClientConfiguration clientConfig = LettuceClientConfiguration.builder()
                .useSsl()
                .build();

        return new LettuceConnectionFactory(config, clientConfig);
    }
}