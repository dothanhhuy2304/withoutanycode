package com.shop.demo.controller;

import com.shop.demo.model.Feedback;
import com.shop.demo.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/Shopping.com/user", method = RequestMethod.GET)
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;


    @RequestMapping(value = "/feedback", method = RequestMethod.POST)
    public String feedback() {
        return "views/feedback";
    }

    @RequestMapping("/feedback/send")
    public String create(Model model) {
        Feedback feedback = new Feedback();
        model.addAttribute("feedback", feedback);
        return "views/feedback";
    }

    @RequestMapping(value = "/feedback/save", method = RequestMethod.POST)
    public String save(@Valid Feedback feedback, BindingResult result, RedirectAttributes redirect) {
        if (result.hasErrors()) {
            return "views/feedback";
        }
        if (feedback != null) {
            feedbackService.save(feedback);
            redirect.addFlashAttribute("message", "Cảm ơn bản đã phản hồi,Rất mong được phục vụ bạn trong tương lai");
            return "redirect:/Shopping.com/user/feedback";
        }
        redirect.addFlashAttribute("error", "Xin lỗi, yêu cầu của bạn vẫn chưa được gửi đi ");
        return "redirect:/Shopping.com/user/feedback";
    }
}
