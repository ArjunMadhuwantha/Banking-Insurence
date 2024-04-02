namespace Bank_Insurance.ViewModel
{
    public class CompositeOtherViewModel
    {
        public AbipreranaViewModel Abiprerana { get; set; }
        public ParithoshithaViewModel Parithoshitha { get; set; }
        public IEnumerable<AbipreranaViewModel> CollectionModelAbiprerana { get; set; }
        public IEnumerable<ParithoshithaViewModel> CollectionModelParithoshitha { get; set; }
    }
}
