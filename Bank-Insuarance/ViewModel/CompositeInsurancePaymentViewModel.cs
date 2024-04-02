namespace Bank_Insurance.ViewModel
{
    public class CompositeInsurancePaymentViewModel
    {
        public InsuarancePaymentViewModel InsuarancePaymentViewModel { get; set; }

        public IEnumerable<InsuarancePaymentViewModel> CollectionModel { get; set; }
    }
}
