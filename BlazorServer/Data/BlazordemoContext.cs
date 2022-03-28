﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using BlazorServer.Models;

#nullable disable

namespace BlazorServer.Data
{
    public partial class BlazordemoContext : DbContext
    {
        public BlazordemoContext()
        {
        }

        public BlazordemoContext(DbContextOptions<BlazordemoContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<TimeKeepingTransaction> TimeKeepingTransactions { get; set; }
        public virtual DbSet<TransactionType> TransactionTypes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.ToTable("Employee");

                entity.Property(e => e.DateHired).HasColumnType("datetime");

                entity.Property(e => e.FirstName).HasMaxLength(50);

                entity.Property(e => e.Gender).HasMaxLength(50);

                entity.Property(e => e.LastName).HasMaxLength(50);
            });

            modelBuilder.Entity<TimeKeepingTransaction>(entity =>
            {
                entity.HasKey(e => e.TimeKeepingTransactionTypeId);

                entity.Property(e => e.TransactionDateTime).HasColumnType("datetime");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.TimeKeepingTransactions)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_TimeKeepingTransactions_Employee");

                entity.HasOne(d => d.TransactionType)
                    .WithMany(p => p.TimeKeepingTransactions)
                    .HasForeignKey(d => d.TransactionTypeId)
                    .HasConstraintName("FK_TimeKeepingTransactions_TransactionType");
            });

            modelBuilder.Entity<TransactionType>(entity =>
            {
                entity.ToTable("TransactionType");

                entity.Property(e => e.TransactionTypeName).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}