package com.shop.demo.controller.employee;

import com.shop.demo.model.Producer;
import com.shop.demo.service.ProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Objects;

@Controller
@RequestMapping(value = "/Shopping.com/employee/producer", method = RequestMethod.GET)
public class ProducerManager {

    @Autowired
    private ProducerService producerService;

    @Autowired
    ServletContext context;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Pageable pageable, HttpServletResponse response) {
        Page<Producer> page = producerService.findAllProducer(pageable);
        response.setHeader("list", "Shopping.com/employee/producer");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("producerList", page.getContent());
        return "/employee/producer-list";
    }


    @RequestMapping(value = "add-producer.htm", method = RequestMethod.GET)
    public String addProducer(Model model) {
        model.addAttribute("producer", new Producer());
        return "employee/form-producer";
    }

    @RequestMapping(value = "edit-producer/{id}.htm", method = RequestMethod.GET)
    public String editProducer(@PathVariable int id, Model model) {
        Producer producer = producerService.findOne(id);
        model.addAttribute("producer", producer);
        return "employee/form-producer";
    }

    @RequestMapping(value = "saveProducer", method = RequestMethod.POST)
    public String saveProducer(@ModelAttribute Producer producer, BindingResult result,
                               @RequestParam("file_image") MultipartFile logo, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("message", "Edit Producer Failure");
            return "employee/form-producer";
        }
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(logo.getOriginalFilename()));
            String path = context.getRealPath("project/producers/" + filePhoto);
            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "The picture is not in the correct format");
                return "employee/form-producer";
            } else if (!logo.isEmpty()) {
                logo.transferTo(new File(path));
                producer.setLogo(filePhoto);
                producerService.save(producer);
                model.addAttribute("message", "Save producer are successfully");
                return "employee/form-producer";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "employee/form-producer";
    }

    @RequestMapping(value = "search-producer.htm", method = RequestMethod.POST)
    public String searchProducer(@RequestParam("key") String key, Pageable pageable, Model model, HttpServletResponse response) {
        Page<Producer> page = producerService.searchProducer(key, pageable);
        response.setHeader("list", "Shopping.com/employee/producer/search-producer.htm");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("producerList", page.getContent());
        return "employee/producer-list";
    }

    @RequestMapping("delete-producer/{id}.htm")
    public String deleteProducer(@PathVariable int id, Model model) {
        Producer producer = producerService.findOne(id);
        producerService.delete(producer);
        model.addAttribute("message", "Delete producer successfully");
        return "redirect:/Shopping.com/employee/producer";
    }


}
