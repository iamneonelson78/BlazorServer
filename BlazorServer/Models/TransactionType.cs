﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BlazorServer.Models
{
    public partial class TransactionType
    {
        public TransactionType()
        {
            TimeKeepingTransactions = new HashSet<TimeKeepingTransaction>();
        }

        public int TransactionTypeId { get; set; }
        public string TransactionTypeName { get; set; }

        public virtual ICollection<TimeKeepingTransaction> TimeKeepingTransactions { get; set; }
    }
}