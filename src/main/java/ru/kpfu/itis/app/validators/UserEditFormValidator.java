package ru.kpfu.itis.app.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import ru.kpfu.itis.app.forms.ClientEditForm;
import ru.kpfu.itis.app.model.User;

import ru.kpfu.itis.app.repositories.UsersRepository;
import ru.kpfu.itis.app.services.AuthenticationService;

import java.util.Optional;

@Component
public class UserEditFormValidator implements Validator {

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.getName().equals(ClientEditForm.class.getName());
    }

    @Transactional
    @Override
    public void validate(Object target, Errors errors) {
        ClientEditForm form = (ClientEditForm) target;
        User old = authenticationService.getUserByAuthentication(SecurityContextHolder.getContext().getAuthentication());

        if (!old.getLogin().equals(form.getLogin())) {
            Optional<User> existedUser = usersRepository.findOneByLogin(form.getLogin());
            if (existedUser.isPresent()) {
                errors.reject("bad.login", "Логин занят");
            }
        }
        if (!form.getEmail().equals(old.getEmail())) {
            Optional<User> existedUser = usersRepository.findOneByEmail(form.getLogin());
            if (existedUser.isPresent()) {
                errors.reject("bad.email", "Email занят");
            }
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "empty.login", "Пустой логин");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "empty.email", "Пустой email");
        if (!form.getPassword1().equals(form.getPassword2())) {
            errors.reject("bad.password", "Пароли не совпадают");
        }
    }

}