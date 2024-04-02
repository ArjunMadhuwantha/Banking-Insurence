using Bank_Insurance.ViewModel;

namespace Bank_Insurance.Repository.InsuarancePayment
{
    public interface IinsuarancePaymentRepository
    {

        Task AddAsync(InsuarancePaymentViewModel payment);

        Task<List<Models.Branch>> GetAllBranches();
        
        Task<List<InsuarancePaymentViewModel>> GetAllTreasharyList(string branchId);

        Task AddInsuarance(InsuarancePaymentViewModel payment);
        Task<bool> CheckID(InsuarancePaymentViewModel payment);

        Task AddTreasurayName(InsuarancePaymentViewModel name);

        Task<bool> CheakTrasuary(InsuarancePaymentViewModel name);

        Task AddTreasuaryInsuarance(InsuarancePaymentViewModel name);
    }
}
