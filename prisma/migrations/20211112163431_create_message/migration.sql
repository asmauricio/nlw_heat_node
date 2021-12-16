BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[messages] (
    [id] INT NOT NULL IDENTITY(1,1),
    [text] NVARCHAR(1000) NOT NULL,
    [created_at] DATETIME2 NOT NULL CONSTRAINT [messages_created_at_df] DEFAULT CURRENT_TIMESTAMP,
    [user_id] INT NOT NULL,
    CONSTRAINT [messages_pkey] PRIMARY KEY ([id])
);

-- AddForeignKey
ALTER TABLE [dbo].[messages] ADD CONSTRAINT [messages_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
