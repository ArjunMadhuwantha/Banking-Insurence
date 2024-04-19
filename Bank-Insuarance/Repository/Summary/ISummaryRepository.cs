using Bank_Insurance.ViewModel;
using Microsoft.EntityFrameworkCore.Storage;

namespace Bank_Insurance.Repository.Summary
{
    public interface ISummaryRepository
    {
        Task<List<Models.Branch>> GetAllBranches();
        Task<List<Models.DivisaranaData>> GetAllMembers();

        //Divisarana Summary
        Task<List<SummaryViewModel>> GetAllDivisaranaCompensationList(string Bid);
        Task<List<DivisaranaViewModel>> GetCustomerDeatils(string PolicyNo);
        Task<List<DivisaranaViewModel>> GetCustomerPaymentDeatils(string PolicyNo);
        Task<List<DivisaranaViewModel>> GetCustomerSuccssoursDeatils(string PolicyNo);


        //Treashary Summary
        Task<List<SummaryViewModel>> GetAllTreasharyBranchPaymentList(string Bid);
        Task<List<SummaryViewModel>> GetAllTreasharyCompensationList(string PolicyNo);



        //banking Summary
        Task<List<SummaryViewModel>> GetAllBankingBranchPaymentList(string Bid);
        Task<List<SummaryViewModel>> GetAllBankCompensationList(string PolicyNo);


        //Health Summary
        Task<List<SummaryViewModel>> GetAllHealthBranchPaymentList(string Bid);
        Task<List<SummaryViewModel>> GetAllHealthCompensationList(string PolicyNo);


        //Building Summary
        Task<List<SummaryViewModel>> GetAllBuildingBranchPaymentList(string Bid);
        Task<List<SummaryViewModel>> GetAllBuildingCompensationList(string PolicyNo);

        //SavingRelief Summary
        Task<List<SummaryViewModel>> GetAllSavingReliefBranchPaymentList(string Bid);
        Task<List<SummaryViewModel>> GetAllSavingReliefCompensationList(string PolicyNo);


        //Loan

        Task<List<SummaryViewModel>> GetAllLoanBranchPaymentList(string Bid,string Type);
        Task<List<SummaryViewModel>> GetAllLoanCustomerPaymentList(string PolicyNo);

        Task<List<SummaryViewModel>> GetAllLoanBranchCompensationList(string Bid, string Type);

    }
}
