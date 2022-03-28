using BlazorServer.Data;
using BlazorServer.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorServer.Service
{
    public class EmployeeService : IEmployeeService
    {
        private readonly BlazordemoContext _context;

        public EmployeeService(BlazordemoContext context)
        {
            _context = context;
        }

        public async Task<List<Employee>> GetAllEmployeesAsync()
        {
            return await _context.Employees.ToListAsync();
        }
        public async Task<bool> InsertEmployeeAsync(Employee emp)
        {
            await _context.Employees.AddAsync(emp);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Employee> GetEmployeeByIdAsync(int employeeId)
        {
            Employee employee = await _context.Employees.FirstOrDefaultAsync(
                    c => c.EmployeeId.Equals(employeeId));
            return employee;
        }
        public async Task<bool> UpdateEmployeeAsync(Employee emp)
        {
            _context.Employees.Update(emp);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteEmployeeAsync(Employee emp)
        {
            _context.Remove(emp);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
