package com.example.employee.service;

import java.util.List;

import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.api.EmployControllerApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.employee.entity.Employee;
import com.example.employee.repository.EmployeeRepo;


@Service
public class EmployService 
{
    @Autowired
    EmployeeRepo empRepo;

    public EmployService() {
    }

    public String add(org.openapitools.client.model.Employee emp)throws ApiException{

        ApiClient client = new ApiClient();
        client.setBasePath("http://localhost:8080");
        EmployControllerApi employControllerApi = new EmployControllerApi();
        employControllerApi.createEmp(emp);
        
        return "Employee "+emp.getName() +"Added SuccessFully";
    }




    public List<org.openapitools.client.model.Employee> read() throws ApiException{

        ApiClient client = new ApiClient();
        client.setBasePath("http://localhost:8080");
        EmployControllerApi employControllerApi = new EmployControllerApi();

        List<org.openapitools.client.model.Employee> emp  = employControllerApi.showEmp();

        return emp;

    }



    // public List<Employee> read(){

    //     return empRepo.findAll();
    // }



    public String update(org.openapitools.client.model.Employee emp, Long id) throws ApiException{

        ApiClient client  = new ApiClient();
        client.setBasePath("http://localhost:8080");
        EmployControllerApi employControllerApi = new EmployControllerApi();
        
        return employControllerApi.updateEmp(id,emp);

        // if(employee != null)
        // {
        //     employee.setName(emp.getName());
        //     employee.setJobId(emp.getJobId());
        //     empRepo.save(employee);

        //     return "Employee "+emp.getName()+ "updated Succesfully.+ \n"+
        //     "Id : "+employee.getId()+"\n"+
        //     "Name : "+employee.getName()+"\n"+
        //     "JobId : "+employee.getJobId();
        // }
        // else 
        // {
           
        //     return "Employee with ID " + id + " not found.";
        // }
    }



        public String delete(Long id) throws ApiException{

            ApiClient client = new ApiClient();
            client.setBasePath("http://localhost:8080");
            EmployControllerApi employControllerApi = new EmployControllerApi();
            
            return employControllerApi.deleteEmp(id);

            // Employee employee = empRepo.findById(id).orElse(null);

            // if(employee != null)
            // {
            //     empRepo.delete(employee);
            //     return "Employee"+employee.getName()+" Deleted Successfuly !";
            // }
            // else
            // {
            //     return "Employee with ID " + id + " not found.";
            // }

        }

    
}
