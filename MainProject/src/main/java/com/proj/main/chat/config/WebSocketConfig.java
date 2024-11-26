package com.proj.main.chat.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.invocation.HandlerMethodArgumentResolver;
import org.springframework.messaging.handler.invocation.HandlerMethodReturnValueHandler;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;


@Configuration  // 서버가 기동할 때 자동 로드
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        // 메시지를 클라이언트로 발송할 브로커를 설정
        config.enableSimpleBroker("/topic");  // 클라이언트가 메시지를 받는 경로 설정
        
        // 클라이언트가 서버로 요청할 경로 설정
        config.setApplicationDestinationPrefixes("/app");  // 메시지를 서버로 보낼 때 경로 접두사
    }
    
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // 클라이언트가 연결할 WebSocket 엔드포인트를 설정
        registry.addEndpoint("/endpoint").withSockJS();  // `/endpoint`로 WebSocket 연결
    }

    @Override
    public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
        // WebSocket 전송에 관련된 추가적인 설정이 필요하면 이 메소드에서 설정
    }

    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        // 클라이언트가 서버로 보내는 메시지에 대한 설정
    }

    @Override
    public void configureClientOutboundChannel(ChannelRegistration registration) {
        // 서버에서 클라이언트로 보내는 메시지에 대한 설정
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        // 메소드 인자 해결에 관련된 설정이 필요한 경우 이곳에서 설정
    }

    @Override
    public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
        // 메소드 반환값 처리기 설정
    }

    @Override
    public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
        // 메시지 컨버터 관련 설정
        return true;
    }
}
