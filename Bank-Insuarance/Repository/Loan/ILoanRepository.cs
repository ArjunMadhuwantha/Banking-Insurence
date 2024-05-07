using Bank_Insurance.Data;
using Bank_Insurance.ViewModel;

namespace Bank_Insurance.Repository.Loan
{
    public interface ILoanRepository
    {
 
        Task<List<Models.Branch>> GetAllBranches();

        Task<bool> CheckID(LoanViewModel payment);

        //Loan
        Task AddBranchToInsuranceLoan(LoanViewModel branch);
        Task AddLoanInsurance(LoanViewModel loan);

        Task AddPaymentLoan(LoanViewModel loan);
        Task<bool> CheckBranchInsuaranceID(LoanViewModel payment);
        Task<bool> CheckCustomerID(LoanViewModel payment);

        //House
        Task AddBranchToInsuranceHouse(LoanViewModel house);
        Task AddHosueLoanInsurance(LoanViewModel house);

        Task AddPaymentHouseLoan(LoanViewModel house);
        Task<bool> CheckBranchInsuaranceIDHouse(LoanViewModel house);
        Task<bool> CheckCustomerIDHouse(LoanViewModel house);


        //Divisarana
        Task AddDivisaranaToInsurance(DivisaranaViewModel divisarana);
        Task AddDivisarana(DivisaranaViewModel divisarana);

        Task<bool> CheckBranchInsuaranceIDDivisarana(DivisaranaViewModel divisarana);

        Task<bool> CheckCustomerIDDivisarana(DivisaranaViewModel divisarana);

        Task AddSuccssor(DivisaranaViewModel succssor);
        Task<List<DivisaranaViewModel>> GetAllSuccssorList(string id);

        Task<bool> CheakDivisaranMemeberID(DivisaranaViewModel divisarana);

        //Divisarana Payment

        Task<List<Models.DivisaranaData>> GetAllMembers();

        

        //Divisarana Compensation

        Task AddDivisaranaCompensation(DivisaranaViewModel compensation);


        Task<List<Models.LoanCustomer>> GetAllLoanMembers();

        Task AddLoanCompensation(LoanViewModel compensation);

        //Task AddHouseLoanCompensation(LoanViewModel compensation);

        Task<List<DivisaranaViewModel>> DivisaranaPaymentDetails(string Bid);

        Task DivisaranaPaymentUpdate(DivisaranaViewModel payment);






        //divisarana NIC number check
        Task<bool> IsNicNumberUnique(string nicNumber);

    }
}
