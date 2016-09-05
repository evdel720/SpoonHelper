export const LikeConstants = {
  CREATE_LIKE: "CREATE_LIKE",
  DESTROY_LIKE: "DESTROY_LIKE"
};

export const createLike = (rId) => ({
  type: LikeConstants.CREATE_LIKE,
  rId
});

export const destroyLike = (rId) => ({
  type: LikeConstants.DESTROY_LIKE,
  rId
});
