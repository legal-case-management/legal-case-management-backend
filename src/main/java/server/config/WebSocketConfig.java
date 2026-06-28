package server.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;

/**
 * Cấu hình WebSocket (STOMP) phục vụ thông báo real-time.
 *
 * - Client kết nối tới endpoint /ws (kèm token qua query param hoặc header CONNECT).
 * - Server đẩy thông báo riêng cho từng tài khoản qua đích /user/queue/notifications
 *   (Spring tự định tuyến theo principal = accountId được set ở {@link JwtHandshakeInterceptor}
 *   / {@link StompAuthChannelInterceptor}).
 */
@Configuration
@EnableWebSocketMessageBroker
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    private final StompAuthChannelInterceptor stompAuthChannelInterceptor;

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        // Đích để server gửi thông báo về client.
        registry.enableSimpleBroker("/queue", "/topic");
        // Tiền tố cho message do client gửi lên (không dùng nhiều nhưng cần khai báo).
        registry.setApplicationDestinationPrefixes("/app");
        // Tiền tố cho thông báo riêng theo user.
        registry.setUserDestinationPrefix("/user");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
                .setAllowedOriginPatterns("*");
        // Cho phép kết nối WebSocket thuần (không SockJS) lẫn SockJS để tương thích nhiều client.
        registry.addEndpoint("/ws")
                .setAllowedOriginPatterns("*")
                .withSockJS();
    }

    @Override
    public void configureClientInboundChannel(org.springframework.messaging.simp.config.ChannelRegistration registration) {
        registration.interceptors(stompAuthChannelInterceptor);
    }
}
