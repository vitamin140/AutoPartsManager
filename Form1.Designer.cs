namespace AutoPartsManager;

partial class Form1
{
    private System.ComponentModel.IContainer components = null;
    private System.Windows.Forms.DataGridView dataGridView1;
    private System.Windows.Forms.Button btnExecute;
    private System.Windows.Forms.ComboBox comboBoxQueries;
    private System.Windows.Forms.Label labelTitle;

    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    private void InitializeComponent()
    {
        this.dataGridView1 = new System.Windows.Forms.DataGridView();
        this.btnExecute = new System.Windows.Forms.Button();
        this.comboBoxQueries = new System.Windows.Forms.ComboBox();
        this.labelTitle = new System.Windows.Forms.Label();
        ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
        this.SuspendLayout();

        // labelTitle
        this.labelTitle.AutoSize = true;
        this.labelTitle.Location = new System.Drawing.Point(12, 18);
        this.labelTitle.Name = "labelTitle";
        this.labelTitle.Size = new System.Drawing.Size(95, 15);
        this.labelTitle.Text = "Оберіть запит:";

        // comboBoxQueries
        this.comboBoxQueries.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
        this.comboBoxQueries.FormattingEnabled = true;
        this.comboBoxQueries.Location = new System.Drawing.Point(115, 15);
        this.comboBoxQueries.Name = "comboBoxQueries";
        this.comboBoxQueries.Size = new System.Drawing.Size(450, 23);

        // btnExecute
        this.btnExecute.Location = new System.Drawing.Point(580, 14);
        this.btnExecute.Name = "btnExecute";
        this.btnExecute.Size = new System.Drawing.Size(120, 25);
        this.btnExecute.Text = "Виконати";
        this.btnExecute.UseVisualStyleBackColor = true;
        this.btnExecute.Click += new System.EventHandler(this.btnExecute_Click);

        // dataGridView1
        this.dataGridView1.AllowUserToAddRows = false;
        this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
        this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
        this.dataGridView1.Location = new System.Drawing.Point(12, 55);
        this.dataGridView1.Name = "dataGridView1";
        this.dataGridView1.Size = new System.Drawing.Size(760, 394);

        // Form1
        this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
        this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        this.ClientSize = new System.Drawing.Size(784, 461);
        this.Controls.Add(this.labelTitle);
        this.Controls.Add(this.comboBoxQueries);
        this.Controls.Add(this.btnExecute);
        this.Controls.Add(this.dataGridView1);
        this.Name = "Form1";
        this.Text = "Магазин автозапчастин - Система керування БД";
        ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
        this.ResumeLayout(false);
        this.PerformLayout();
    }
}