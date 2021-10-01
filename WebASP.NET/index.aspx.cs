using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP.NET
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Hide the pricing and order panel
            panPricing.Visible = panOrder.Visible = false;
            if (!Page.IsPostBack)
            {
                //Hide the address when the to deliver checkbox is not checked
                txtAddress.Visible = lblAddress.Visible = false;
                //Add the type of pizza into the dropdownlist
                //                               text          value(price)
                cboPizza.Items.Add(new ListItem("Vegetarian", "10"));
                cboPizza.Items.Add(new ListItem("Hawaiians", "12"));
                cboPizza.Items.Add(new ListItem("All Dressed", "8"));
                cboPizza.Items.Add(new ListItem("Halal", "20"));
                //Add the size
                lstPizzaSize.Items.Add(new ListItem("Small", "1"));
                lstPizzaSize.Items.Add(new ListItem("Medium", "1.5"));
                lstPizzaSize.Items.Add(new ListItem("Large", "2"));
                //Select the default index
                lstPizzaSize.SelectedIndex = 0;
                // Toppings
                chklstToppings.Items.Add(new ListItem("Bacon", "3"));
                chklstToppings.Items.Add(new ListItem("Mushroom", "1"));
                chklstToppings.Items.Add(new ListItem("Extra Cheese", "2"));
                chklstToppings.Items.Add(new ListItem("Olive", "2.5"));
                //Crust
                radlstCrust.Items.Add(new ListItem("Normal"));
                radlstCrust.Items.Add(new ListItem("Thin"));
                radlstCrust.Items.Add(new ListItem("Thick"));
                radlstCrust.SelectedIndex = 0;

            }

            if (cboPizza.SelectedIndex > 0)
            {
                calculatePrice();
            }



        } //End of Page_Load

        // Create a function outside of Page_Load 
        private void calculatePrice()
        {
            decimal baseP = 0, delivery = 0, total = 0, toppings = 0, subTotal = 0, tax = 0;

            // Get the Value of the Item selected, we also need to convert the value from string into decimal
            baseP = Convert.ToDecimal(cboPizza.SelectedItem.Value) * Convert.ToDecimal(lstPizzaSize.SelectedItem.Value);
            litPricing.Text = "<br><b>Base Price: $ </b> " + baseP + "</br>";
            if (chkDelivery.Checked)
            {
                delivery = 3;
                litPricing.Text += "<b>Delivery Price: $ </b>" + delivery + "</br>";
            }
            //because we can choose one or more topping or none, so we use foreach
            foreach (ListItem item in chklstToppings.Items)
            {
                //+= is recursion
                toppings += (item.Selected) ? Convert.ToDecimal(item.Value) : 0;
            }
            litPricing.Text += "<b>Toppings Price: $ </b>" + toppings + "</br>";

            subTotal = baseP + delivery + toppings;
            litPricing.Text += "<b>SubTotal : $ </b>" + subTotal + "</br>";

            //tax = (subTotal * Convert.ToDecimal(0.15));
            tax = Math.Round(subTotal + Convert.ToDecimal(0.15), 2); 
            litPricing.Text += "<b>Tax: $ </b>" + tax + "</br>";

            total = Math.Round(subTotal + tax,2);
            litPricing.Text += "<b>Total: $ </b>" + total + "</br>";

            panPricing.Visible = true;
        }

        protected void chkDelivery_CheckedChanged(object sender, EventArgs e)
        {
            txtAddress.Visible = lblAddress.Visible = chkDelivery.Checked;
            /*if (chkDelivery.Checked)
            {
                lblAddress.Visible = true;
                txtAddress.Visible = true;
            }
            else
            {
                lblAddress.Visible = false;
                txtAddress.Visible = false;
            }*/
        }

        //this method is empty, it is just for the purpose of autopostback
        protected void cboPizza_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnOrderNow_Click(object sender, EventArgs e)
        {
            panOrder.Visible = true;
            litOrder.Text = "Sir/Miss " + txtCustomer.Text + "," + "</br>Your order for a " +  lstPizzaSize.SelectedItem.Text + " " + cboPizza.SelectedItem.Text + " Pizza";

            int selectedCount = chklstToppings.Items.Cast<ListItem>().Count(li => li.Selected);
            if (selectedCount > 0)
            {
                litOrder.Text += "</br>with toppings of :";
                litOrder.Text += "<ul>";
                foreach (ListItem item in chklstToppings.Items)
                {
                    litOrder.Text += (item.Selected) ? "<li>" + item.Text + "</li>" : "";
                }
                litOrder.Text += "</ul>";
            }
            else
            {
                litOrder.Text += "</br>without any topping.</br>";
            }
            litOrder.Text += "On a " + radlstCrust.SelectedItem.Text + " crust.";
            
            if ( chkDelivery.Checked)
            {
                if(txtAddress.Text.Trim().Count() > 0)
                {
                    litOrder.Text += "</br>will be delivered at " + txtAddress.Text + " soon.";
                }
                else
                {
                    litOrder.Text += "</br>Please enter your address!!!";
                }
            }
            else
            {
                litOrder.Text += "</br>The pizza is pick up.";
            }
            //litOrder.Text += ((chkDelivery.Checked)& txtAddress.Text.Trim().Count() >0)? "</br>will be delivered at " + txtAddress.Text +" soon.": "</br>The pizza is pick up.";
            
        }
    }
}