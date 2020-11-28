package com.shop.demo.service.impl;

import com.shop.demo.model.Producer;
import com.shop.demo.repository.ProducerRepository;
import com.shop.demo.service.ProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProducerServiceImpl implements ProducerService {

    @Autowired
    private ProducerRepository producerRepository;

    @Override
    public List<Producer> findAll() {
        return producerRepository.findAll();
    }

    @Override
    public List<Producer> search(int id) {
        return null;
    }

    @Override
    public Producer findOne(Integer id) {
        return producerRepository.findById(id).get();
    }

    @Override
    public void save(Producer producer) {
        producerRepository.save(producer);
    }

    @Override
    public void delete(Producer producer) {
        producerRepository.delete(producer);
    }

    @Override
    public Page<Producer> findAllProducer(Pageable pageable) {
        return producerRepository.findAll(pageable);
    }

    @Override
    public Page<Producer> searchProducer(String key, Pageable pageable) {
        return producerRepository.searchProducer(key, pageable);
    }
}
