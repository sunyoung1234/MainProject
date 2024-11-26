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


@Configuration  // ������ �⵿�� �� �ڵ� �ε�
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        // �޽����� Ŭ���̾�Ʈ�� �߼��� ���Ŀ�� ����
        config.enableSimpleBroker("/topic");  // Ŭ���̾�Ʈ�� �޽����� �޴� ��� ����
        
        // Ŭ���̾�Ʈ�� ������ ��û�� ��� ����
        config.setApplicationDestinationPrefixes("/app");  // �޽����� ������ ���� �� ��� ���λ�
    }
    
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // Ŭ���̾�Ʈ�� ������ WebSocket ��������Ʈ�� ����
        registry.addEndpoint("/endpoint").withSockJS();  // `/endpoint`�� WebSocket ����
    }

    @Override
    public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
        // WebSocket ���ۿ� ���õ� �߰����� ������ �ʿ��ϸ� �� �޼ҵ忡�� ����
    }

    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        // Ŭ���̾�Ʈ�� ������ ������ �޽����� ���� ����
    }

    @Override
    public void configureClientOutboundChannel(ChannelRegistration registration) {
        // �������� Ŭ���̾�Ʈ�� ������ �޽����� ���� ����
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        // �޼ҵ� ���� �ذῡ ���õ� ������ �ʿ��� ��� �̰����� ����
    }

    @Override
    public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
        // �޼ҵ� ��ȯ�� ó���� ����
    }

    @Override
    public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
        // �޽��� ������ ���� ����
        return true;
    }
}
