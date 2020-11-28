package com.shop.demo.service;


import com.shop.demo.model.Producer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProducerService {

    List<Producer> findAll();

    List<Producer> search(int id);

    Producer findOne(Integer id);

    void save(Producer producer);

    void delete(Producer producer);

    Page<Producer> findAllProducer(Pageable pageable);

    Page<Producer> searchProducer(String key, Pageable pageable);


}
