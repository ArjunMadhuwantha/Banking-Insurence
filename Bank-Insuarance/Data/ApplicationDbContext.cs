using Bank_Insuarance.Models;
using Bank_Insurance.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Bank_Insurance.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public static object Divisarana { get; internal set; }

        //user
        public DbSet<ApplicationUser> ApplicationUser { get; set; }


        public DbSet<Zone> Zones { get; set; }
        public DbSet<Branch> Branches { get; set; }
        public DbSet<InsuranceProduct> InsuranceProducts { get; set; }
        public DbSet<Insuarance> Insuarances { get; set; }

        //SavingRelief
        public DbSet<SavingRelief> SavingReliefs { get; set; }
        public DbSet<SavingReliefData> SavingReliefDatas { get; set; }
        public DbSet<SavingReliefCompensation> SavingReliefCompensations { get; set; }

        //BankingInsuarance
        public DbSet<BankingInsuarance> BankingInsuarances { get; set; }
        public DbSet<BankingInsuaranceData> BankingInsuaranceDatas { get; set; }
        public DbSet<BankingInsuaranceCompenstaion> BankingInsuaranceCompenstaions { get; set; }

        //BuildingInsuarance
        public DbSet<BuildingInsuarance> BuildingInsuarances { get; set; }
        public DbSet<BuildingInsuaranceData> BuildingInsuaranceDatas { get; set; }
        public DbSet<BuildiingInsuranceCompenstaion> BuildiingInsuranceCompenstaions { get; set; }

        //HealthInsuarance
        public DbSet<HealthInsuarance> HealthInsuarances { get; set; }
        public DbSet<HealthInsuaranceData> HealthInsuaranceDatas { get; set; }
        public DbSet<HealthInsuranceCompenstaion> HealthInsuranceCompenstaions { get; set; }

        //Treasurary
        public DbSet<Treasuary> Treasuaries { get; set; }
        public DbSet<TreasuaryData> TreasuaryDatas { get; set; }
        public DbSet<TreasuaryesCollection> TreasuaryesCollections { get; set; }
        public DbSet<TreasuraryInsuranceCompenstaion> TreasuraryInsuranceCompenstaions { get; set; }


        public DbSet<LoanTbl> LoanTbls { get; set; }
        public DbSet<LoanCustomer> LoanCustomers { get; set; }
        public DbSet<LoanPayment> LoanPayments { get; set; }
        public DbSet<LoanCompenstaion> LoanCompenstaions { get; set; }
        public DbSet<DivisaranaData> DivisaranaDatas { get; set; }
        public DbSet<DivisaranaSuccssor> DivisaranaSuccssors { get; set; }
        public DbSet<DivisaranaTbl> DivisaranaTbls { get; set; }
        public DbSet<DivisaranaPayment> DivisaranaPayments { get; set; }
        public DbSet<DivisaranaCompensation> DivisaranaCompensations { get; set; }
        public DbSet<DivisaranaCircleDate> DivisaranaCircleDates { get; set; }

        //Parithoshitha
        public DbSet<DivisaranaParithoshitha> DivisaranaParithoshithas { get; set; }
        public DbSet<SavingReliefParithoshitha> SavingReliefParithoshithas { get; set; }

        //Abiprerana
        public DbSet<DivisaranaAbhiperana> DivisaranaAbhiperanas { get; set; }
    }
}
