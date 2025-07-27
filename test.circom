include "../node_modules/circomlib/circuits/comparators.circom";

template TaxProof() {
  signal input invoiceAmount; // Amount from a single invoice
  signal input taxRate;      // Tax rate (e.g., from Tier Management)
  signal input taxAmount;    // Expected tax for this invoice
  signal output out;         // 1 if valid, 0 otherwise

  // Calculate tax based on invoice amount and tax rate
  signal calculatedTax;
  calculatedTax <== invoiceAmount * taxRate;

  // Use IsEqual comparator to check if calculatedTax equals taxAmount
  component equalCheck = IsEqual();
  equalCheck.in[0] <== calculatedTax;
  equalCheck.in[1] <== taxAmount;
  out <== equalCheck.out;
}

component main = TaxProof();