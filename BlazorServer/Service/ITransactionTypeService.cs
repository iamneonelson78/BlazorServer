using BlazorServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorServer.Service
{
    public interface ITransactionTypeService
    {
        public Task<List<TransactionType>> GetAllTransactionTypesAsync();
        public Task<TransactionType> GetTransactionTypeByIdAsync(int Id);
    }
}
