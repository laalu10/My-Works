package com.example.employee.controller;

import java.util.List;

import org.openapitools.client.ApiException;
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
    public String createEmp(@RequestBody org.openapitools.client.model.Employee emp) throws ApiException
    {
        return empService.add(emp); 
    }



    @GetMapping("/show")
    public List<org.openapitools.client.model.Employee> showEmp()throws ApiException
    {
        return empService.read();
    }



    @PutMapping("update/{id}")
    public String updateEmp(@RequestBody org.openapitools.client.model.Employee emp,@PathVariable Long id) throws ApiException{
        return empService.update(emp,id);
    }


    @DeleteMapping("/delete/{id}")
    public String deleteEmp(@PathVariable Long id) throws ApiException{
        return empService.delete(id);
    }
}
