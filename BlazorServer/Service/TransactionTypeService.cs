using BlazorServer.Data;
using BlazorServer.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorServer.Service
{
    public class TransactionTypeService : ITransactionTypeService
    {
        private readonly BlazordemoContext _context;

        public TransactionTypeService(BlazordemoContext context)
        {
            _context = context;
        }

        public async Task<List<TransactionType>> GetAllTransactionTypesAsync()
        {
            return await _context.TransactionTypes.ToListAsync();
        }
    }
}
