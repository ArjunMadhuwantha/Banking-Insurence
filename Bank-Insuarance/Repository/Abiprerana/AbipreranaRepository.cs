using Bank_Insurance.Data;
using Bank_Insurance.ViewModel;
using Microsoft.EntityFrameworkCore;

namespace Bank_Insurance.Repository.Abiprerana
{
    public class AbipreranaRepository : IAbipreranaRepository
    {
        private readonly ApplicationDbContext _dbContext;
        public AbipreranaRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task AddDivisaranaAbiprerana(AbipreranaViewModel req)
        {
            var NewDivisaranaAbiprerana = new Models.DivisaranaAbhiperana()
            {
                Month = req.Month,
                Amount = req.Amount,
                Comment = req.Comment,
                BranchId = req.BranchId


            };

            await _dbContext.DivisaranaAbhiperanas.AddAsync(NewDivisaranaAbiprerana);
            await _dbContext.SaveChangesAsync();
        }

        public async  Task<List<Models.Branch>> GetAllDiviBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        public async Task<List<AbipreranaViewModel>> GetDivisaranaAbipreranaPaymentList(string Bid)
        {
            var Payments = await _dbContext.DivisaranaAbhiperanas
                .Where(b => b.BranchId == Bid)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<AbipreranaViewModel> AbipreranaViewModels = new List<AbipreranaViewModel>();

            foreach (var payment in Payments)
            {
                var abipreranaViewModel = new AbipreranaViewModel
                {
                    BranchName = branch?.Branch_name,
                    Month = payment.Month,
                    Amount = payment.Amount,
                    Comment = payment.Comment,
                    
                };

                AbipreranaViewModels.Add(abipreranaViewModel);
            }

            return AbipreranaViewModels;
        }
    }
}
