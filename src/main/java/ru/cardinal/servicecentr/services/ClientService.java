package ru.cardinal.servicecentr.services;

import org.springframework.stereotype.Service;
import ru.cardinal.servicecentr.models.Client;
import ru.cardinal.servicecentr.models.DeviceEntity;

import java.util.List;

@Service
public interface ClientService {

    void saveClient(Client client);
    Client findByName(String name);

    List<Client> findAll();

    void deleteById(Long id);

    List<DeviceEntity> findAllByClientId(Long id);
}
