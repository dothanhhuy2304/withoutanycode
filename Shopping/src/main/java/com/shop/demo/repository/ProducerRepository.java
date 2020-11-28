package com.shop.demo.repository;

import com.shop.demo.model.Producer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProducerRepository extends JpaRepository<Producer, Integer> {

    @Query(value = "select c from Producer c where c.email like '%' || :key || '%'" +
            "or c.address like '%' || :key || '%'" +
            "or c.nameProducer like '%' || :key || '%' ")
    Page<Producer> searchProducer(@Param("key") String key, Pageable pageable);


}
