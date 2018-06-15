package ru.kpfu.itis.app.aspects;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

@Aspect
@Component
public class LoggingAspect {

    @Autowired
        private Logger logger;

        @AfterThrowing(pointcut = "within(ru.kpfu.itis.app.services..*)", throwing = "exception")
        public void logException(JoinPoint jp, Exception exception) {
            Method method = ((MethodSignature) jp.getSignature()).getMethod();
            logger.error(method.getDeclaringClass().getName() + "." + method.getName() + " produced --- " + exception);
        }
        @Before("within(ru.kpfu.itis.app.services..*)")
        public void log(JoinPoint jp) {
            MethodSignature methodSignature = (MethodSignature) jp.getSignature();
            Method method = methodSignature.getMethod();
            logger.info(method.getDeclaringClass().getName() + "." + method.getName() + " is started.");
        }
}

