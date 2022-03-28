using BlazorServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorServer.Service
{
    public interface ITimekeepingService
    {
        public Task<List<TimeKeepingTransaction>> GetAllTransactions();
        public Task<bool> InsertTransactionAsync(TimeKeepingTransaction transaction);
        public Task<TimeKeepingTransaction> GetTransactionByIdAsync(int Id);
        public Task<bool> UpdateTransactionAsync(TimeKeepingTransaction transaction);
        public Task<bool> DeleteTransactionAsync(TimeKeepingTransaction transaction);
    }
}
