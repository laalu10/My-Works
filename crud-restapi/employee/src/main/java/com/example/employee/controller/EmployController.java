package com.example.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.employee.entity.Employee;
import com.example.employee.service.EmployService;

@RestController
public class EmployController 
{
    @Autowired
    EmployService empService;


    @PostMapping("/create")
    public String createEmp(@RequestBody Employee emp)
    {
        return empService.add(emp); 
    }



    @GetMapping("/show")
    public List<Employee> showEmp()
    {
        return empService.read();
    }



    @PutMapping("update/{id}")
    public String updateEmp(@RequestBody Employee emp,@PathVariable Long id){
        return empService.update(emp,id);
    }


    @DeleteMapping("/delete/{id}")
    public String deleteEmp(@PathVariable Long id){
        return empService.delete(id);
    }
}
