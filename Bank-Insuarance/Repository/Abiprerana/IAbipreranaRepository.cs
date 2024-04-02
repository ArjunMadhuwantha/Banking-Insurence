using Bank_Insurance.ViewModel;

namespace Bank_Insurance.Repository.Abiprerana
{
    public interface IAbipreranaRepository
    {
        //Divi
        Task AddDivisaranaAbiprerana(AbipreranaViewModel req);
        
        Task<List<Models.Branch>> GetAllDiviBranches();

        Task<List<AbipreranaViewModel>> GetDivisaranaAbipreranaPaymentList(string Bid);
    }
}
