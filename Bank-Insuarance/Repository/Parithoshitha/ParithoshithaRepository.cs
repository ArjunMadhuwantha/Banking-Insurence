using Bank_Insurance.Data;
using Bank_Insurance.Models;
using Bank_Insurance.ViewModel;
using Microsoft.EntityFrameworkCore;

namespace Bank_Insurance.Repository.Parithoshitha
{
    public class ParithoshithaRepository : IParithoshithaRepository
    {
        private readonly ApplicationDbContext _dbContext;
        public ParithoshithaRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        //Divi
        public async Task AddDivisaranaParithoshitha(ParithoshithaViewModel req)
        {
            var NewDivisaranaParithoshitha = new Models.DivisaranaParithoshitha()
            {
                Name= req.DName,
                MemberNo = req.DMemberNo,
                Amount = req.DAmount,
                Comment = req.DComment,
                BranchId = req.BranchId

            };

            await _dbContext.DivisaranaParithoshithas.AddAsync(NewDivisaranaParithoshitha);
            await _dbContext.SaveChangesAsync();

        }
        public async Task<List<Models.Branch>> GetAllDiviBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        //Saving
        public async Task AddSavingReliefParithoshitha(ParithoshithaViewModel req)
        {
            var NewsavingReliefParithoshitha = new Models.SavingReliefParithoshitha()
            {
                Name = req.SName,
                MemberNo = req.SMemberNo,
                Amount = req.SAmount,
                Comment = req.SComment,
                BranchId = req.BranchId

            };
            await _dbContext.SavingReliefParithoshithas.AddAsync(NewsavingReliefParithoshitha);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<List<Models.Branch>> GetAllSavingBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        public async Task<List<ParithoshithaViewModel>> GetDivisaranaParithoshithaPaymentList(string Bid)
        {
            var Payments = await _dbContext.DivisaranaParithoshithas
                .Where(b => b.BranchId == Bid)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<ParithoshithaViewModel> ParithoshithaViewModels = new List<ParithoshithaViewModel>();

            foreach (var payment in Payments)
            {
                var parithoshithaModel = new ParithoshithaViewModel
                {
                    BranchName = branch?.Branch_name,
                    DName = payment.Name,
                    DMemberNo = payment.MemberNo,
                    DAmount = payment.Amount,
                    DComment = payment.Comment,
                };

                ParithoshithaViewModels.Add(parithoshithaModel);
            }

            return ParithoshithaViewModels;
        }

        public async Task<List<ParithoshithaViewModel>> GetSavingReliefParithoshithaPaymentList(string Bid)
        {
            var Payments = await _dbContext.SavingReliefParithoshithas
                .Where(b => b.BranchId == Bid)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<ParithoshithaViewModel> ParithoshithaViewModels = new List<ParithoshithaViewModel>();

            foreach (var payment in Payments)
            {
                var parithoshithaModel = new ParithoshithaViewModel
                {
                    BranchName = branch?.Branch_name,
                    DName = payment.Name,
                    DMemberNo = payment.MemberNo,
                    DAmount = payment.Amount,
                    DComment = payment.Comment,
                };

                ParithoshithaViewModels.Add(parithoshithaModel);
            }

            return ParithoshithaViewModels;
        }
    }
}
