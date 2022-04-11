/*
  Warnings:

  - You are about to drop the `_CategoryToUser` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name]` on the table `Category` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "_CategoryToUser" DROP CONSTRAINT "_CategoryToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToUser" DROP CONSTRAINT "_CategoryToUser_B_fkey";

-- DropTable
DROP TABLE "_CategoryToUser";

-- CreateTable
CREATE TABLE "User_Category" (
    "userId" UUID NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "User_Category_pkey" PRIMARY KEY ("userId","categoryId")
);

-- CreateTable
CREATE TABLE "News" (
    "id" UUID NOT NULL,
    "title" VARCHAR(150) NOT NULL,
    "link" VARCHAR(125) NOT NULL,
    "image_url" VARCHAR(125) NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "saved_at" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "News_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_News" (
    "userId" UUID NOT NULL,
    "newsId" UUID NOT NULL,

    CONSTRAINT "User_News_pkey" PRIMARY KEY ("userId","newsId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");

-- AddForeignKey
ALTER TABLE "User_Category" ADD CONSTRAINT "User_Category_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Category" ADD CONSTRAINT "User_Category_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "News" ADD CONSTRAINT "News_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_News" ADD CONSTRAINT "User_News_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_News" ADD CONSTRAINT "User_News_newsId_fkey" FOREIGN KEY ("newsId") REFERENCES "News"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
