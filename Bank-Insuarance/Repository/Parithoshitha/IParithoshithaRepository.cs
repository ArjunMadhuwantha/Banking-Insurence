using Bank_Insurance.Models;
using Bank_Insurance.ViewModel;

namespace Bank_Insurance.Repository.Parithoshitha
{
    public interface IParithoshithaRepository
    {
        //Divi
        Task AddDivisaranaParithoshitha(ParithoshithaViewModel req);
       
        Task<List<Models.Branch>> GetAllDiviBranches();

        Task<List<ParithoshithaViewModel>> GetDivisaranaParithoshithaPaymentList(string Bid);

        //Saving

        Task AddSavingReliefParithoshitha(ParithoshithaViewModel req);
        Task<List<Models.Branch>> GetAllSavingBranches();

        Task<List<ParithoshithaViewModel>> GetSavingReliefParithoshithaPaymentList(string Bid);


    }
}
