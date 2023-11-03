package ru.cardinal.servicecentr.services;


import org.springframework.stereotype.Service;
import ru.cardinal.servicecentr.models.UserEntity;

import java.security.Principal;
import java.util.List;

@Service
public interface UserService {
    boolean createUser(UserEntity user);

    UserEntity getUserByPrincipal(Principal principal);

    List<UserEntity> findAll();

    void changeActiveStatus(Long id);
}
