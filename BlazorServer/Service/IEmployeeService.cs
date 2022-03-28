using BlazorServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorServer.Service
{
    interface IEmployeeService
    {
        public Task<List<Employee>> GetAllEmployeesAsync();
        public Task<bool> InsertEmployeeAsync(Employee emp);
        public Task<Employee> GetEmployeeByIdAsync(int employeeId);
        public Task<bool> UpdateEmployeeAsync(Employee emp);
        public Task<bool> DeleteEmployeeAsync(Employee emp);
    }
}
