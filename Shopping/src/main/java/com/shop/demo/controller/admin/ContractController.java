package com.shop.demo.controller.admin;

import com.shop.demo.model.Contract;
import com.shop.demo.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping(value = "Shopping.com/admin/contract", method = RequestMethod.GET)
public class ContractController {

    @Autowired
    private ContractService contractService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Pageable pageable, HttpServletResponse response) {
        Page<Contract> page = contractService.findAll(pageable);
        response.setHeader("list", "Shopping.com/admin/contract");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("contractList", page.getContent());
        return "admin/contract-list";
    }

    @RequestMapping(value = "add-contract.htm", method = RequestMethod.GET)
    public String addContract(Model model) {
        model.addAttribute("contract", new Contract());
        return "admin/add-contract";
    }

    @RequestMapping(value = "save-contract", method = RequestMethod.POST)
    public String saveContract(@ModelAttribute("contract") Contract contract, BindingResult result, Model model) throws Exception {
        try {
            if (result.hasErrors()) {
                return "admin/add-contract";
            }
            contractService.save(contract);
            model.addAttribute("message", "Thêm hợp đồng thành công");
            return "admin/add-contract";
        } catch (Exception e) {
            model.addAttribute("message", "<span>Xin lỗi nhân viên này đã tồn tại." +
                    "Vui lòng quay trở lại <a href='Shopping.com/admin/contract'><p style='color='red''>Trang chủ</p></a></span>");
        }
        return "admin/add-contract";
    }

    //Tìm kiếm tại index
    @RequestMapping(value = "search.htm", method = RequestMethod.POST)
    public String searchByDepartment(@RequestParam("id") String id, @RequestParam("key") String key, Model model) {
        if (id.isEmpty() && key.isEmpty()) {
            return "redirect:/Shopping.com/admin/contract";
        }
        if (!id.isEmpty() && key.isEmpty()) {
            model.addAttribute("contractList", contractService.search(id));
            return "admin/contract-s";
        } else if (!id.isEmpty() && !key.isEmpty()) {
            model.addAttribute("contractList", contractService.searchBy2(id, key));
            return "admin/contract-s";
        }
        return "admin/contract-s";
    }

    @RequestMapping(value = "filter.htm", method = RequestMethod.POST)
    public String filterByStatus(@RequestParam("filter") Integer filter, Model model) {
        if (filter == 0) {
            return "redirect:/Shopping.com/admin/contract";
        }
        model.addAttribute("contractList", contractService.findContractByStatus(filter));
        return "admin/contract-s";
    }

    @RequestMapping(value = "edit-contract/{id}.htm", method = RequestMethod.POST)
    public String editContract(@PathVariable long id, Model model) {
        model.addAttribute("contract", contractService.findOne(id));
        return "admin/edit-contract";
    }

    @RequestMapping(value = "save-edit-contract", method = RequestMethod.POST)
    public String saveEditContract(@Valid @ModelAttribute("contract") Contract contract, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "admin/edit-contract";
        }
        if (contract == null) {
            model.addAttribute("message", "Vui lòng nhập đầy đủ thông tin");
            return "admin/edit-contract";
        }
        contractService.save(contract);
        model.addAttribute("message", "Chỉnh xửa hợp đồng thành công");
        return "admin/edit-contract";
    }


    @RequestMapping(value = "delete-contract/{id}.htm", method = RequestMethod.POST)
    public String deleteContract(@PathVariable long id, Model model) {
        Contract contract = contractService.findOne(id);
        contractService.delete(contract);
        model.addAttribute("message", "Xóa hợp đồng thành công");
        return "redirect:/Shopping.com/admin/contract";
    }

    @RequestMapping(value = "reset-status/{id}.htm")
    public String resetStatus(@PathVariable long id, Model model) {
        Contract contract = contractService.findOne(id);
        contract.setStatus(1);
        contractService.save(contract);
//        model.addAttribute("message","Gia hạn thành công");
        return "redirect:/Shopping.com/admin/contract";
    }

    @RequestMapping(value = "end-contract/{id}.htm")
    public String endContract(@PathVariable long id, Model model) {
        Contract contract = contractService.findOne(id);
        contract.setStatus(2);
        contractService.save(contract);
//        model.addAttribute("message","Kết thúc hợp đồng thành công");
        return "redirect:/Shopping.com/admin/contract";
    }

}
