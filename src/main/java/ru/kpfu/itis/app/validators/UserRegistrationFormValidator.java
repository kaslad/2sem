package ru.kpfu.itis.app.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import ru.kpfu.itis.app.forms.UserRegistrationForm;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.UsersRepository;

import java.util.Optional;

@Component
public class UserRegistrationFormValidator implements Validator {

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.getName().equals(UserRegistrationForm.class.getName());
    }

    @Transactional
    @Override
    public void validate(Object target, Errors errors) {
        UserRegistrationForm form = (UserRegistrationForm) target;

        Optional<User> existedUser = usersRepository.findOneByLogin(form.getLogin());

        if (existedUser.isPresent()) {
            errors.reject("bad.login", "Логин занят");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "empty.login", "Пустой логин");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "empty.password", "Пустой пароль");
        if (!form.getPassword().equals(form.getPassword2())) {
            errors.reject("bad.password", "Пароли не совпадают");
        }


    }

}