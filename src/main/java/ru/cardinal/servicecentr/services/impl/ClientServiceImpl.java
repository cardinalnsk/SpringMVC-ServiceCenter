package ru.cardinal.servicecentr.services.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.cardinal.servicecentr.models.Client;
import ru.cardinal.servicecentr.models.DeviceEntity;
import ru.cardinal.servicecentr.repositories.ClientRepo;
import ru.cardinal.servicecentr.services.ClientService;
import ru.cardinal.servicecentr.services.DeviceService;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ClientServiceImpl implements ClientService {
    private final ClientRepo clientRepo;
    private final DeviceService deviceService;
    @Override
    public void saveClient(Client client) {
            clientRepo.save(client);
    }

    @Override
    public Client findByName(String name) {
        return clientRepo.findByName(name).orElse(new Client());
    }

    @Override
    public List<Client> findAll() {
        return clientRepo.findAll();
    }

    @Override
    public void deleteById(Long id) {
        if (clientRepo.existsById(id)) {
            clientRepo.deleteById(id);
        }
    }

    @Override
    public List<DeviceEntity> findAllByClientId(Long id) {
        return deviceService.findAllByClientId(id);
    }
}
