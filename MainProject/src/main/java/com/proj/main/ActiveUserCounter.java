package com.proj.main;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class ActiveUserCounter implements HttpSessionListener {

    private static int activeSessions = 0;

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        activeSessions++;
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        if (activeSessions > 0) {
            activeSessions--;
        }
    }

    public static int getActiveSessions() {
        return activeSessions;
    }
}
