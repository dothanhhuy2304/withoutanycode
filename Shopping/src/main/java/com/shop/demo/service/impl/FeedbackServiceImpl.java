package com.shop.demo.service.impl;

import com.shop.demo.model.Feedback;
import com.shop.demo.repository.FeedbackRepository;
import com.shop.demo.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepository;

    @Override
    public List<Feedback> findAll() {
        return feedbackRepository.findAll();
    }

    @Override
    public List<Feedback> search(String key) {
        return null;
    }

    @Override
    public Feedback findOne(int id) {
        return feedbackRepository.findById(id).get();
    }

    @Override
    public void save(Feedback feedback) {
        feedbackRepository.save(feedback);
    }

    @Override
    public void delete(Feedback feedback) {
        feedbackRepository.delete(feedback);
    }
}
