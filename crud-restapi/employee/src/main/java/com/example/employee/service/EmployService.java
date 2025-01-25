package com.example.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.employee.entity.Employee;
import com.example.employee.repository.EmployeeRepo;


@Service
public class EmployService 
{
    @Autowired
    EmployeeRepo empRepo;

    public String add(Employee emp){
        empRepo.save(emp);
        return "Employee "+emp.getName() +"Added SuccessFully";
    }




    public List<Employee> read(){

        return empRepo.findAll();
    }



    public String update(Employee emp, Long id){
        Employee employee = empRepo.findById(id).orElse(null);

        if(employee != null)
        {
            employee.setName(emp.getName());
            employee.setJobId(emp.getJobId());
            empRepo.save(employee);

            return "Employee "+emp.getName()+ "updated Succesfully.+ \n"+
            "Id : "+employee.getId()+"\n"+
            "Name : "+employee.getName()+"\n"+
            "JobId : "+employee.getJobId();
        }
        else 
        {
           
            return "Employee with ID " + id + " not found.";
        }
    }



        public String delete(Long id){

            Employee employee = empRepo.findById(id).orElse(null);

            if(employee != null)
            {
                empRepo.delete(employee);
                return "Employee"+employee.getName()+" Deleted Successfuly !";
            }
            else
            {
                return "Employee with ID " + id + " not found.";
            }

        }

    
}
