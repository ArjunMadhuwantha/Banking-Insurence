namespace Bank_Insurance.ViewModel
{
    public class CompositeSummaryViewModel
    {
        public SummaryViewModel SummaryViewModel { get; set; }

        public IEnumerable<SummaryViewModel> CollectionSummaryModel { get; set; }
    }
}
