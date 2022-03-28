using BlazorServer.Data;
using BlazorServer.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorServer.Service
{
    public class TimekeepingService : ITimekeepingService
    {
        private readonly BlazordemoContext _context;

        public TimekeepingService(BlazordemoContext context)
        {
            _context = context;
        }

        public async Task<List<TimeKeepingTransaction>> GetAllTransactions()
        {
            return await _context.TimeKeepingTransactions
                .Include(x => x.Employee)
                .Include(x => x.TransactionType)
                .ToListAsync();
        }
        public async Task<bool> InsertTransactionAsync(TimeKeepingTransaction transaction)
        {
            await _context.TimeKeepingTransactions.AddAsync(transaction);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<TimeKeepingTransaction> GetTransactionByIdAsync(int Id)
        {
            TimeKeepingTransaction transaction = await _context.TimeKeepingTransactions.FirstOrDefaultAsync(
                    c => c.TimeKeepingTransactionTypeId.Equals(Id));
            return transaction;
        }
        public async Task<bool> UpdateTransactionAsync(TimeKeepingTransaction transaction)
        {
            _context.TimeKeepingTransactions.Update(transaction);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteTransactionAsync(TimeKeepingTransaction transaction)
        {
            _context.Remove(transaction);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
