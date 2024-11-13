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


@Configuration  // 다른 context 파일처럼 서버 기동시 자동으로 로드됨
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{
    
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
    	
    	// /subscribe로 시작하는 "destination" 헤더를 가진 메세지를 브로커로 라우팅한다.
        config.enableSimpleBroker("/subscribe");
        
        // 이렇게 적어주고 /app/hello/' + roomNo 형태로 요청하면
        // ChatLogController의 @MessageMapping("/hello/{roomNo}")가 동작
        config.setApplicationDestinationPrefixes("/app");  
    }
    
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	// WebSocket 또는 SockJS Client가 웹소켓 핸드셰이크 커넥션을 생성할 경로
        registry.addEndpoint("/endpoint").withSockJS();
    }

	@Override
	public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
	}

	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
	}

	@Override
	public void configureClientOutboundChannel(ChannelRegistration registration) {
	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
	}

	@Override
	public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
	}

	@Override
	public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
		return true;
	}
}
