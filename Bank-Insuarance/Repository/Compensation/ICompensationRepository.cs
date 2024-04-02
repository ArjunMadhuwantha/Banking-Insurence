using Bank_Insurance.ViewModel;

namespace Bank_Insurance.Repository.Compensation
{
    public interface ICompensationRepository
    {
        //savining
        Task AddSavingCompensation(SavingCompenstaionViewModel req);

        Task<List<Models.Branch>> GetAllBranches();

        Task<bool> CheckID(SavingCompenstaionViewModel req);


        //Treasurary

        Task AddTreasuraryCompensation(TreasuraryCompenstaionViewModel req);
        Task<bool> CheckTreasuraryID(TreasuraryCompenstaionViewModel req);
        Task<List<Models.Branch>> GetAllTreasuraryBranches();


        //Health
        Task AddHealthCompensation(HealthInsuranceCompenstaionViewModel req);
        Task<bool> CheckHealthID(HealthInsuranceCompenstaionViewModel req);
        Task<List<Models.Branch>> GetAllHealthBranches();


        //Building
        Task AddBuildingCompensation(BuildiingInsuranceCompenstaionViewModel req);
        Task<bool> CheckBuildingID(BuildiingInsuranceCompenstaionViewModel req);
        Task<List<Models.Branch>> GetAllBuildingBranches();

        //Banking
        Task AddBankingCompensation(BankingInsuranceCompenstaionViewModel req);
        Task<bool> CheckBankingID(BankingInsuranceCompenstaionViewModel req);
        Task<List<Models.Branch>> GetAllBankingBranches();
    }
}
