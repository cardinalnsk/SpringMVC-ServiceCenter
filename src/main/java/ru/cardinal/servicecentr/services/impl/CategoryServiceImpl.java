package ru.cardinal.servicecentr.services.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.cardinal.servicecentr.models.CategoryEntity;
import ru.cardinal.servicecentr.models.DeviceEntity;
import ru.cardinal.servicecentr.repositories.CategoryRepo;
import ru.cardinal.servicecentr.services.CategoryService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepo categoryRepo;
    @Override
    public boolean save(CategoryEntity category) {
        if (categoryRepo.findByName(category.getName()).isPresent()) {
            return false;
        }
        categoryRepo.save(category);
        return true;
    }

    @Override
    public List<CategoryEntity> findAll() {
        return categoryRepo.findAll();
    }

    @Override
    public CategoryEntity findById(Long id) {
        return categoryRepo.findById(id).orElse(null);
    }

    @Override
    public void deleteById(Long id) {
        categoryRepo.deleteById(id);
    }

    @Override
    public List<DeviceEntity> findAllByCategoryId(Long id) {
        CategoryEntity category = categoryRepo.findById(id).orElse(null);
        if (category != null) {
            return category.getDevice();
        }
        return null;
    }
}
