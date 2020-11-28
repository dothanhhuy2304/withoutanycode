package com.shop.demo.service;

import com.shop.demo.model.Feedback;

import java.util.List;

public interface FeedbackService {

    List<Feedback> findAll();

    List<Feedback> search(String key);

    Feedback findOne(int id);

    void save(Feedback feedback);

    void delete(Feedback feedback);
}
