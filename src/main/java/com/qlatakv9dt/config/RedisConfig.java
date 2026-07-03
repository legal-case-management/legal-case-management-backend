package com.qlatakv9dt.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;

@Configuration
public class RedisConfig {

    @Value("${spring.data.redis.url}")
    private String redisUrl;

    @Bean
    public LettuceConnectionFactory redisConnectionFactory() {
        boolean useSsl = redisUrl.startsWith("rediss://");
        String cleanedUrl = redisUrl.replace("rediss://", "").replace("redis://", "");
        String[] urlParts = cleanedUrl.split("@");

        String username = null;
        String password = null;
        String host;
        int port;

        if (urlParts.length == 2) {
            String[] authParts = urlParts[0].split(":");
            String[] hostParts = urlParts[1].split(":");

            username = authParts.length > 0 ? authParts[0] : null;
            password = authParts.length > 1 ? authParts[1] : null;
            host = hostParts[0];
            port = Integer.parseInt(hostParts[1]);
        } else {
            String[] hostParts = cleanedUrl.split(":");
            host = hostParts[0];
            port = Integer.parseInt(hostParts[1]);
        }

        RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
        config.setHostName(host);
        config.setPort(port);

        if (username != null && password != null) {
            config.setUsername(username);
            config.setPassword(password);
        }

        LettuceClientConfiguration.LettuceClientConfigurationBuilder clientConfigBuilder =
                LettuceClientConfiguration.builder();

        if (useSsl) {
            clientConfigBuilder.useSsl();
        }

        return new LettuceConnectionFactory(config, clientConfigBuilder.build());
    }
}
