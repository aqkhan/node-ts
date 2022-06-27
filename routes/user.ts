import express, { Request, Response } from 'express';
import { createUser } from '../controllers/user';

const userRouter = express.Router();

userRouter.post('/', async (req: Request, res: Response) => {
  const user = req.body;
  // TODO: Validate req.body
  const createdUser = await createUser(user);
  res.json(createdUser);
});

export { userRouter };
