package ru.kpfu.itis.app.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.User;

import ru.kpfu.itis.app.repositories.ClientRepository;
import ru.kpfu.itis.app.services.AuthenticationService;

import java.util.Optional;

@Component
public class ClientEditFormValidator implements Validator {

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private ClientRepository clientRepository;

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.getName().equals(UserEditForm.class.getName());
    }

    @Transactional
    @Override
    public void validate(Object target, Errors errors) {
        /*ClientEditForm form = (ClientEditForm) target;
        User old = authenticationService.getUserByAuthentication(SecurityContextHolder.getContext().getAuthentication());

        if (!old.getLogin().equals(form.getLogin())) {
            Optional<User> existedUser = clientRepository.findOneByLogin(form.getLogin());
            if (existedUser.isPresent()) {
                errors.reject("bad.login", "Логин занят");
            }
        }
        if (!form.getEmail().equals(old.getEmail())) {
            Optional<User> existedUser = clientRepository.findOneByEmail(form.getLogin());
            if (existedUser.isPresent()) {
                errors.reject("bad.email", "Email занят");
            }
        }
        if (!form.getPassword1().equals(form.getPassword2())) {
            errors.reject("bad.password", "Пароли не совпадают");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "empty.login", "Пустой логин");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "empty.email", "Пустой email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password1", "empty.password", "Пустой password");
        */

    }

}